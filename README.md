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
Updated: 2026-06-07T16:08:35.840657+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.642 |  |
| ap-east-2 | 0.576 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.611 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.655 |  |
| ap-southeast-5 | 0.739 |  |
| ap-southeast-6 | 0.653 |  |
| ap-southeast-7 | 0.819 |  |
| ca-central-1 | 0.291 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.549 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.594 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.584 |  |
| eu-west-1 | 0.472 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.532 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.996 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.662 |  |
| us-east-1 | 0.221 | 4730 |
| us-east-2 | 0.234 | 1627 |
| us-gov-east-1 | 0.221 | 1709 |
| us-gov-west-1 | 0.133 | 198 |
| us-west-1 | 0.087 | 3644 |
| us-west-2 | 0.149 | 162 |

