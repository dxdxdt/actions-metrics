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
Updated: 2026-06-14T08:38:47.273046+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.894 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.516 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.525 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.158 | 4757 |
| us-east-2 | 0.161 | 1633 |
| us-gov-east-1 | 0.168 | 1712 |
| us-gov-west-1 | 0.208 | 198 |
| us-west-1 | 0.154 | 3662 |
| us-west-2 | 0.207 | 163 |

