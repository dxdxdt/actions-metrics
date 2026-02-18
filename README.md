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
Updated: 2026-02-18T09:39:25.655640+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.191 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.505 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.881 |  |
| me-south-1 | 0.844 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.610 |  |
| us-east-1 | 0.144 | 4138 |
| us-east-2 | 0.128 | 1354 |
| us-gov-east-1 | 0.130 | 1487 |
| us-gov-west-1 | 0.183 | 154 |
| us-west-1 | 0.462 | 3073 |
| us-west-2 | 0.185 | 126 |

