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
Updated: 2026-03-06T01:24:15.233399+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.073 |  |
| ap-east-1 | 0.642 |  |
| ap-east-2 | 0.572 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.567 |  |
| ap-northeast-3 | 0.477 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.635 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.653 |  |
| ap-southeast-7 | 0.813 |  |
| ca-central-1 | 0.294 | 16 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.580 |  |
| eu-central-2 | 0.593 |  |
| eu-north-1 | 0.630 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.530 |  |
| eu-west-3 | 0.550 |  |
| il-central-1 | 0.756 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.914 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.685 |  |
| us-east-1 | 0.241 | 4226 |
| us-east-2 | 0.226 | 1401 |
| us-gov-east-1 | 0.227 | 1532 |
| us-gov-west-1 | 0.127 | 172 |
| us-west-1 | 0.071 | 3181 |
| us-west-2 | 0.130 | 141 |

