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
Updated: 2026-04-24T19:45:39.148223+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.862 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.414 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.089 | 4557 |
| us-east-2 | 0.117 | 1528 |
| us-gov-east-1 | 0.125 | 1662 |
| us-gov-west-1 | 0.291 | 194 |
| us-west-1 | 0.238 | 3471 |
| us-west-2 | 0.291 | 157 |

