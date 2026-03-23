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
Updated: 2026-03-23T10:46:06.782901+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.857 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.433 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.453 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.766 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.082 | 4338 |
| us-east-2 | 0.077 | 1448 |
| us-gov-east-1 | 0.098 | 1596 |
| us-gov-west-1 | 0.260 | 189 |
| us-west-1 | 0.244 | 3285 |
| us-west-2 | 0.263 | 151 |

