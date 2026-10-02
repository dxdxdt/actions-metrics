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
Updated: 2026-10-02T16:26:41.249904+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.587 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.713 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.214 | 18 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.191 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.169 | 5133 |
| us-east-2 | 0.177 | 1689 |
| us-gov-east-1 | 0.179 | 1932 |
| us-gov-west-1 | 0.188 | 236 |
| us-west-1 | 0.127 | 4151 |
| us-west-2 | 0.188 | 192 |

