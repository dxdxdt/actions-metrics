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
Updated: 2026-07-25T15:58:50.125362+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.632 |  |
| ap-south-1 | 0.842 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.761 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.144 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.087 | 4908 |
| us-east-2 | 0.117 | 1664 |
| us-gov-east-1 | 0.119 | 1777 |
| us-gov-west-1 | 0.278 | 207 |
| us-west-1 | 0.222 | 3831 |
| us-west-2 | 0.277 | 170 |

