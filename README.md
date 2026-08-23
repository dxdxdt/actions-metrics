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
Updated: 2026-08-23T15:15:04.793118+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.175 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.151 | 5050 |
| us-east-2 | 0.143 | 1681 |
| us-gov-east-1 | 0.124 | 1872 |
| us-gov-west-1 | 0.211 | 225 |
| us-west-1 | 0.151 | 4038 |
| us-west-2 | 0.211 | 184 |

