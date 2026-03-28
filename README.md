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
Updated: 2026-03-28T14:26:25.497684+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.719 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.841 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.598 |  |
| us-east-1 | 0.160 | 4380 |
| us-east-2 | 0.164 | 1459 |
| us-gov-east-1 | 0.167 | 1610 |
| us-gov-west-1 | 0.216 | 190 |
| us-west-1 | 0.149 | 3315 |
| us-west-2 | 0.206 | 152 |

