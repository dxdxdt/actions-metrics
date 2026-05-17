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
Updated: 2026-05-17T11:56:08.115047+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.705 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.606 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.800 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.125 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.478 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.089 | 4653 |
| us-east-2 | 0.088 | 1598 |
| us-gov-east-1 | 0.113 | 1696 |
| us-gov-west-1 | 0.264 | 195 |
| us-west-1 | 0.206 | 3571 |
| us-west-2 | 0.266 | 158 |

