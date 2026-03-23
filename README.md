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
Updated: 2026-03-23T06:06:40.672293+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.490 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.611 |  |
| ap-southeast-3 | 0.773 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.683 |  |
| ap-southeast-7 | 0.824 |  |
| ca-central-1 | 0.288 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.566 |  |
| eu-central-2 | 0.587 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.598 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.532 |  |
| eu-west-3 | 0.537 |  |
| il-central-1 | 0.745 |  |
| me-central-1 | 0.959 |  |
| me-south-1 | 0.907 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.676 |  |
| us-east-1 | 0.224 | 4336 |
| us-east-2 | 0.213 | 1447 |
| us-gov-east-1 | 0.215 | 1595 |
| us-gov-west-1 | 0.142 | 189 |
| us-west-1 | 0.083 | 3285 |
| us-west-2 | 0.143 | 151 |

