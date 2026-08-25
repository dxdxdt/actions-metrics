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
Updated: 2026-08-25T23:18:51.573468+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.598 |  |
| ap-northeast-2 | 0.703 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.147 | 18 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.783 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.511 |  |
| us-east-1 | 0.077 | 5065 |
| us-east-2 | 0.101 | 1684 |
| us-gov-east-1 | 0.117 | 1885 |
| us-gov-west-1 | 0.285 | 228 |
| us-west-1 | 0.235 | 4054 |
| us-west-2 | 0.287 | 188 |

