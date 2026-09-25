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
Updated: 2026-09-25T06:55:00.575755+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.842 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.894 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.102 | 18 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.422 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.429 |  |
| eu-south-2 | 0.449 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.062 | 5121 |
| us-east-2 | 0.074 | 1686 |
| us-gov-east-1 | 0.072 | 1927 |
| us-gov-west-1 | 0.288 | 235 |
| us-west-1 | 0.226 | 4136 |
| us-west-2 | 0.283 | 192 |

