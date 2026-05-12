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
Updated: 2026-05-12T22:06:30.495698+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.709 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.531 |  |
| ap-northeast-2 | 0.636 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.713 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.890 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.155 | 4630 |
| us-east-2 | 0.124 | 1590 |
| us-gov-east-1 | 0.130 | 1687 |
| us-gov-west-1 | 0.207 | 195 |
| us-west-1 | 0.157 | 3556 |
| us-west-2 | 0.202 | 158 |

