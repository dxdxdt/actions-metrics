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
Updated: 2026-03-26T07:57:57.902102+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.779 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.437 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.699 |  |
| me-central-1 | 0.881 |  |
| me-south-1 | 0.835 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.179 | 4360 |
| us-east-2 | 0.168 | 1456 |
| us-gov-east-1 | 0.167 | 1604 |
| us-gov-west-1 | 0.185 | 190 |
| us-west-1 | 0.129 | 3300 |
| us-west-2 | 0.188 | 151 |

