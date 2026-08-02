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
Updated: 2026-08-02T05:27:38.520754+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.983 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.813 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.151 | 17 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.471 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.176 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.117 | 4931 |
| us-east-2 | 0.121 | 1673 |
| us-gov-east-1 | 0.101 | 1796 |
| us-gov-west-1 | 0.215 | 209 |
| us-west-1 | 0.159 | 3868 |
| us-west-2 | 0.215 | 172 |

