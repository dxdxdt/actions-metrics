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
Updated: 2026-03-05T15:43:21.259923+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.978 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.517 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.121 | 4225 |
| us-east-2 | 0.115 | 1401 |
| us-gov-east-1 | 0.112 | 1532 |
| us-gov-west-1 | 0.199 | 171 |
| us-west-1 | 0.218 | 3176 |
| us-west-2 | 0.199 | 141 |

