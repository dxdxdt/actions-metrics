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
Updated: 2026-04-22T15:07:19.575822+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.979 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.795 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.125 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.106 | 4542 |
| us-east-2 | 0.098 | 1524 |
| us-gov-east-1 | 0.097 | 1661 |
| us-gov-west-1 | 0.271 | 194 |
| us-west-1 | 0.221 | 3458 |
| us-west-2 | 0.269 | 157 |

