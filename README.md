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
Updated: 2026-08-23T00:50:52.529900+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.214 | 18 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.153 | 5048 |
| us-east-2 | 0.172 | 1681 |
| us-gov-east-1 | 0.168 | 1869 |
| us-gov-west-1 | 0.212 | 225 |
| us-west-1 | 0.150 | 4029 |
| us-west-2 | 0.212 | 184 |

