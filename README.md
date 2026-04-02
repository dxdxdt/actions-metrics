# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-04-02T16:50:00.644131+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.636 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.455 |  |
| ap-northeast-2 | 0.558 |  |
| ap-northeast-3 | 0.481 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.705 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.769 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.807 |  |
| ca-central-1 | 0.277 | 16 |
| ca-west-1 | 0.154 |  |
| eu-central-1 | 0.578 |  |
| eu-central-2 | 0.601 |  |
| eu-north-1 | 0.636 |  |
| eu-south-1 | 0.606 |  |
| eu-south-2 | 0.629 |  |
| eu-west-1 | 0.505 |  |
| eu-west-2 | 0.538 |  |
| eu-west-3 | 0.566 |  |
| il-central-1 | 0.758 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.279 |  |
| sa-east-1 | 0.697 |  |
| us-east-1 | 0.229 | 4419 |
| us-east-2 | 0.202 | 1474 |
| us-gov-east-1 | 0.203 | 1621 |
| us-gov-west-1 | 0.117 | 191 |
| us-west-1 | 0.111 | 3337 |
| us-west-2 | 0.117 | 153 |

