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
Updated: 2026-08-23T14:16:00.167281+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.213 | 18 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.453 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.606 |  |
| us-east-1 | 0.157 | 5050 |
| us-east-2 | 0.173 | 1681 |
| us-gov-east-1 | 0.161 | 1871 |
| us-gov-west-1 | 0.202 | 225 |
| us-west-1 | 0.143 | 4038 |
| us-west-2 | 0.203 | 184 |

