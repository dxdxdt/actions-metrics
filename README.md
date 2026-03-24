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
Updated: 2026-03-24T23:25:11.769099+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.149 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.803 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.115 | 4354 |
| us-east-2 | 0.111 | 1450 |
| us-gov-east-1 | 0.111 | 1601 |
| us-gov-west-1 | 0.247 | 190 |
| us-west-1 | 0.194 | 3292 |
| us-west-2 | 0.242 | 151 |

