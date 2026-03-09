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
Updated: 2026-03-09T17:42:19.940951+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.648 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.580 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.860 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.173 | 4249 |
| us-east-2 | 0.165 | 1412 |
| us-gov-east-1 | 0.164 | 1548 |
| us-gov-west-1 | 0.180 | 176 |
| us-west-1 | 0.143 | 3202 |
| us-west-2 | 0.182 | 144 |

