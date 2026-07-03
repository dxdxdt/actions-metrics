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
Updated: 2026-07-03T12:02:48.695608+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.684 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.848 |  |
| ca-central-1 | 0.248 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.573 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.213 | 4813 |
| us-east-2 | 0.160 | 1650 |
| us-gov-east-1 | 0.174 | 1728 |
| us-gov-west-1 | 0.157 | 200 |
| us-west-1 | 0.099 | 3734 |
| us-west-2 | 0.157 | 164 |

