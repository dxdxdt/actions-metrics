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
Updated: 2026-08-29T18:04:35.035167+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.669 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.595 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.747 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.767 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.239 | 18 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.555 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.196 | 5073 |
| us-east-2 | 0.201 | 1684 |
| us-gov-east-1 | 0.177 | 1889 |
| us-gov-west-1 | 0.157 | 228 |
| us-west-1 | 0.101 | 4067 |
| us-west-2 | 0.159 | 189 |

