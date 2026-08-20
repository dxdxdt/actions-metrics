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
Updated: 2026-08-20T15:26:11.329791+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.885 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.171 | 18 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.104 | 5028 |
| us-east-2 | 0.131 | 1680 |
| us-gov-east-1 | 0.122 | 1862 |
| us-gov-west-1 | 0.257 | 224 |
| us-west-1 | 0.201 | 4003 |
| us-west-2 | 0.249 | 184 |

