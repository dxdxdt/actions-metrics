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
Updated: 2026-04-29T21:54:30.953964+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.638 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.142 | 4576 |
| us-east-2 | 0.129 | 1547 |
| us-gov-east-1 | 0.131 | 1667 |
| us-gov-west-1 | 0.218 | 194 |
| us-west-1 | 0.160 | 3501 |
| us-west-2 | 0.214 | 157 |

