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
Updated: 2026-07-25T16:55:28.056654+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.876 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.752 |  |
| ap-northeast-1 | 0.632 |  |
| ap-northeast-2 | 0.733 |  |
| ap-northeast-3 | 0.656 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.882 |  |
| ap-southeast-2 | 0.794 |  |
| ap-southeast-3 | 0.930 |  |
| ap-southeast-4 | 0.830 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.409 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.308 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.498 |  |
| us-east-1 | 0.061 | 4909 |
| us-east-2 | 0.103 | 1664 |
| us-gov-east-1 | 0.104 | 1777 |
| us-gov-west-1 | 0.303 | 207 |
| us-west-1 | 0.247 | 3831 |
| us-west-2 | 0.302 | 170 |

