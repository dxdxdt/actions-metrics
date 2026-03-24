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
Updated: 2026-03-24T14:16:17.345931+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.777 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.703 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.800 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.767 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.103 | 4350 |
| us-east-2 | 0.136 | 1449 |
| us-gov-east-1 | 0.143 | 1600 |
| us-gov-west-1 | 0.263 | 190 |
| us-west-1 | 0.235 | 3290 |
| us-west-2 | 0.265 | 151 |

