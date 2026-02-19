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
Updated: 2026-02-19T16:43:06.312656+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.053 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.619 |  |
| ap-southeast-3 | 0.785 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.650 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.271 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.568 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.608 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.592 |  |
| eu-west-1 | 0.490 |  |
| eu-west-2 | 0.512 |  |
| eu-west-3 | 0.541 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.899 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.658 |  |
| us-east-1 | 0.224 | 4144 |
| us-east-2 | 0.208 | 1356 |
| us-gov-east-1 | 0.213 | 1492 |
| us-gov-west-1 | 0.166 | 156 |
| us-west-1 | 0.092 | 3082 |
| us-west-2 | 0.158 | 128 |

