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
Updated: 2026-05-16T15:51:53.011834+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.698 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.612 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.741 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.856 |  |
| ap-southeast-6 | 0.835 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.157 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.596 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.109 | 4647 |
| us-east-2 | 0.121 | 1596 |
| us-gov-east-1 | 0.110 | 1694 |
| us-gov-west-1 | 0.259 | 195 |
| us-west-1 | 0.205 | 3568 |
| us-west-2 | 0.258 | 158 |

