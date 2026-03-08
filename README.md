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
Updated: 2026-03-08T14:19:10.031458+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.650 |  |
| ap-northeast-1 | 0.531 |  |
| ap-northeast-2 | 0.636 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.745 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.176 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.828 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.148 | 4240 |
| us-east-2 | 0.116 | 1408 |
| us-gov-east-1 | 0.113 | 1545 |
| us-gov-west-1 | 0.188 | 175 |
| us-west-1 | 0.207 | 3195 |
| us-west-2 | 0.178 | 144 |

