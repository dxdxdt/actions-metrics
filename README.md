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
Updated: 2026-05-04T17:24:39.753588+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.851 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.626 |  |
| me-central-1 | 0.826 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.104 | 4592 |
| us-east-2 | 0.103 | 1566 |
| us-gov-east-1 | 0.100 | 1673 |
| us-gov-west-1 | 0.248 | 194 |
| us-west-1 | 0.189 | 3531 |
| us-west-2 | 0.242 | 157 |

