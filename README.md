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
Updated: 2026-06-18T05:30:41.399502+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.850 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.476 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.082 | 4767 |
| us-east-2 | 0.086 | 1635 |
| us-gov-east-1 | 0.081 | 1714 |
| us-gov-west-1 | 0.278 | 198 |
| us-west-1 | 0.227 | 3676 |
| us-west-2 | 0.279 | 163 |

