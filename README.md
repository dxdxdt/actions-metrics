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
Updated: 2026-06-08T17:45:12.882998+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.556 |  |
| ap-south-1 | 0.870 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.789 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.718 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.230 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.523 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.175 | 4735 |
| us-east-2 | 0.169 | 1628 |
| us-gov-east-1 | 0.175 | 1709 |
| us-gov-west-1 | 0.207 | 198 |
| us-west-1 | 0.156 | 3647 |
| us-west-2 | 0.203 | 162 |

