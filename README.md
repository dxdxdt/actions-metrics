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
Updated: 2026-08-21T20:16:53.545732+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.723 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.771 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.971 |  |
| ca-central-1 | 0.137 | 18 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.444 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.563 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.072 | 5039 |
| us-east-2 | 0.085 | 1680 |
| us-gov-east-1 | 0.092 | 1867 |
| us-gov-west-1 | 0.293 | 225 |
| us-west-1 | 0.246 | 4014 |
| us-west-2 | 0.295 | 184 |

