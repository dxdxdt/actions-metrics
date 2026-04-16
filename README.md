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
Updated: 2026-04-16T17:06:04.341634+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.729 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.149 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.122 | 4511 |
| us-east-2 | 0.108 | 1505 |
| us-gov-east-1 | 0.105 | 1652 |
| us-gov-west-1 | 0.232 | 193 |
| us-west-1 | 0.175 | 3420 |
| us-west-2 | 0.225 | 156 |

